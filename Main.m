object = PraseImage;
object.bw;
object.readIm();
object.changeToBw()

object.makeLighter(0);
object.changeContrast(1);
object.changeCorelation(2.1);

object.binOtsu();
object.gradient(0.1, 1.4,'o');
imshow(object.currentIm);