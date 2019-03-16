package avgsector;

import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class WeatherMapper extends Mapper<LongWritable,Text,Text,LongWritable>
{

	
	
	@Override
	public void map(LongWritable offset, Text text,Context context)	throws IOException, InterruptedException
	{
		String temp=text.toString();
		String[] parts=temp.split(",");
		String p0=parts[4].trim();
		String p1=parts[9];
		Text t1=new Text(p1);
		if(!(p1.equalsIgnoreCase("null")))
		{
		 int id=Integer.parseInt(p0);
		 //LongWritable lw=new LongWritable(id);
		 //String b=p1.trim();
		 //String c=b.substring(0, 4);
		 //String c=p1.substring(3, 7);
		 
		 //double d=Double.parseDouble(c);
		 //DoubleWritable dw=new DoubleWritable(d);
		 context.write(t1,new LongWritable(id));
		}
	}
		// TODO Auto-generated method stub
		
	}
 