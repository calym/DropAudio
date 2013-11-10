

	// var jsString = "Hello from JavaScript!";
	//         var printMessage = function (msg) {
	//             document.getElementById('msg').innerHTML = "Message: " + msg;
	//         };


var canvas = document.getElementById("sketch");
// attaching the sketchProc function to the canvas
//var processingInstance = new Processing(canvas, sketchProc);
//var processingInstance;
var processingInstance;
        function clearCanvas(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.setup();
        }

        function incrementGravity(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.incrementGravity();
        }

        function decrementGravity(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.decrementGravity();
        }

        function collisionOn(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.collisionOn();
        }
        function collisionOff(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.collisionOff();
        }
        function incrementFriction(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.incrementFriction();
        }
        function decrementFriction(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.decrementFriction();
        }
        function incrementSpring(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.incrementSpring();
        }
        function decrementSpring(on) {
                processingInstance = Processing.getInstanceById('sketch');
                processingInstance.decrementSpring();
        }
            
        
