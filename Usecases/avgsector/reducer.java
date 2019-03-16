package avgsector;

import java.io.IOException;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.*;


public class WeatherReducer extends Reducer<Text,LongWritable,Text, DoubleWritable>
{

	
	public void reduce(Text key, Iterable<LongWritable> value,Context context)
			throws IOException, InterruptedException 
	{
		int count=0;
		double sum=0;
	  for(LongWritable val:value)
	  {
		  
		  sum+=val.get();
		  count++;
	  }
	  double temp=sum/count;
	  //LongWritable max=new LongWritable(temp);
	  context.write(key,new DoubleWritable(temp));
 
	}
	

}
