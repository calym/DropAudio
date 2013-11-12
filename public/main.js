
// var gravity = gravity;
//         var printGravity = function (gravity) {
//             document.getElementById('gravity').innerHTML = "gravity: " + gravity;
//         };

$( document ).ready(function() {
        var canvas = document.getElementById("sketch");
        var processingInstance;

        $("#reset").click(function() {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.setup();
        });

        // $("#gravityup").click(function() {
        //         processingInstance = Processing.getInstanceById('sketch');
        //         processingInstance.incrementGravity();
        // });

        // $("#gravitydown").click(function() {
        //         processingInstance = Processing.getInstanceById('sketch');
        //         processingInstance.decrementGravity();
        // });

        $("#collide").click(function() {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.collisionOn();
        });

        $("#collideoff").click(function() {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.collisionOff();
        });

        $("#getvalue").simpleSlider();
        $("#getvalue").bind("slider:changed", function (event, data) {
          //The currently selected value of the slider
          processingInstance = Processing.getInstanceById('sketch');
          processingInstance.changeGravity(data.value);
          gravity = data.value;
          //console.log(gravity);
          // The value as a ratio of the slider (between 0 and 1)
          // alert(data.ratio);
        });
        $("#getvalue").simpleSlider("setValue", 0.05);
        $("#getvalue").simpleSlider("setRatio", 0.009);

        /////

        // $("#fric").simpleSlider();
        // $("#fric").bind("slider:changed", function (event, data) {
        //   //The currently selected value of the slider
        //   processingInstance = Processing.getInstanceById('sketch');
        //   processingInstance.changeFriction(data.value);
        //   friction = data.value;
        //   // The value as a ratio of the slider (between 0 and 1)
        //   // alert(data.ratio);
        // });
        // $("#fric").simpleSlider("setValue", -0.05);
        // $("#fric").simpleSlider("setRatio", 0.009);


                  
}); //closes document