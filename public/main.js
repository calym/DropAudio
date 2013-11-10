

	var jsString = "Hello from JavaScript!";
	        var printMessage = function (msg) {
	            document.getElementById('msg').innerHTML = "Message: " + msg;
	        };


var canvas = document.getElementById("sketch");
// attaching the sketchProc function to the canvas
var processingInstance = new Processing(canvas, sketchProc);
    

var processingInstance;
        function startSketch() {
            switchSketchState(true);
        }

        function stopSketch() {
            switchSketchState(false);
            
        }

        function switchSketchState(on) {
            if (!processingInstance) {
                processingInstance = Processing.getInstanceById('sketch');
            }

            if (on) {

                //processingInstance.loop();  // call Processing loop() function
                // processingInstance.println("clicky?");
                // processingInstance.size(200,200);
                // processingInstance.background(0);
                console.log(processingInstance);
                console.log("hey!");



            } else {
                processingInstance.noLoop(); // stop animation, call noLoop()
            }
        }


