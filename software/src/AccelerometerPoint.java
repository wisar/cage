/**
 * Created by IntelliJ IDEA.
 * User: epall
 * Date: Feb 15, 2010
 * Time: 2:31:52 PM
 * To change this template use File | Settings | File Templates.
 */
public class AccelerometerPoint {
    public byte x;
    public byte y;
    public byte z;

    public AccelerometerPoint(byte[] data){
        x = data[0];
        y = data[1];
        z = data[2];
    }

    public AccelerometerPoint(byte x1, byte y1, byte z1) {
        x = x1;
        y = y1;
        z = z1;
    }
}
