//$(document).ready(function(){
//    $('.deleteRecord').click(function() {
//        if($('#confirmOverlay').length){
//            // A confirm is already shown on the page:
//            //return false;
//        }
//        
//        var clickedContinue = false;
//        var clickedCancel = false;
//
//        var markup = '<div id="confirmOverlay"> <div id="confirmBox"> <p>' + $(this).data('message') + '</p> <div id="confirmButtons"> <button id="confirmYes" class="confirmButton blue">Yes</button> <button id="confirmNo" class="confirmButton red">No</button> </div> </div> </div>';
//
//        $(markup).appendTo('body');
//
//        $("#confirmYes").click(function(){
//            clickedContinue = true;
//        });
//
//        $("#confirmNo").click(function(){
//            clickedCancel = true;
//        });
//        
//        if (clickedContinue) {
//            $('#confirmOverlay').fadeOut(function(){
//                $(this).remove();
//            });
//            return true;
//        } else if (clickedCancel) {
//            $('#confirmOverlay').fadeOut(function(){
//                $(this).remove();
//            });
//            return false;
//        }
//        //return false;
//    });
//});

function vleConfirm(message) {
    if($('#confirmOverlay').length){
        // A confirm is already shown on the page:
        //return false;
    }

    var clickedContinue = false;
    var clickedCancel = false;

    var markup = '<div id="confirmOverlay"> <div id="confirmBox"> <p>' + message + '</p> <div id="confirmButtons"> <button id="confirmYes" class="confirmButton blue">Yes</button> <button id="confirmNo" class="confirmButton red">No</button> </div> </div> </div>';

    $(markup).appendTo('body');

    $("#confirmYes").click(function(){
        hideOverlay($('#confirmOverlay'));
        clickedContinue = true;
    });

    $("#confirmNo").click(function(){
        hideOverlay($('#confirmOverlay'));
        clickedCancel = true;
    });

    if (clickedContinue) {
        return true;
    } else if (clickedCancel) {
        return false;
    }
}

function hideOverlay(theOverlay) {
    $(theOverlay).fadeOut(function(){
        $(this).remove();
    });    
}