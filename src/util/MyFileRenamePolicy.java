package util;

import java.io.File;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * mulipart 업로드시 강제로 파일명 변경(현재 날짜 시간)
 * @author withsky
 *
 */
public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		// Get the parent directory path as in h:/home/user or /home/user
		String parentDir = f.getParent();

		// Get filename without its path location, such as 'index.txt'
		String fname = f.getName();

		Random rd = new Random();
	    int rNum = rd.nextInt(1000);
	    
		String fileExt = "";
		int i = -1;
		if ((i = fname.indexOf(".")) != -1) {

			fileExt = fname.substring(i);
			fname = fname.substring(0, i);
		}

		// add the timestamp
		fname = new Date().getTime()+"_"+rNum;

		// piece together the filename
		fname = parentDir + System.getProperty("file.separator") + fname
				+ fileExt;

		File temp = new File(fname);

		return temp;
	}
	
	public static void main(String[] args) {
		System.out.println(new Date().getTime());
	}

}
