package com.xuecheng.manage_media_process;

import com.xuecheng.framework.utils.Mp4VideoUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class TestProcessBuilder {

    //使用processBuilder来调用第三方应用程序
    @Test
    public void testProcessBuilder() throws IOException {
        //创建processBuilder对象
        ProcessBuilder processBuilder = new ProcessBuilder();
        //设置第三方应用程序的命令
//        processBuilder.command("ping","127.0.0.1");
        processBuilder.command("ipconfig");

        //将标准输入流和错误流合并
        processBuilder.redirectErrorStream(true);
        //启动一个进程
        Process process = processBuilder.start();

        //通过标准输入流来拿到正常和错误的信息
        InputStream inputStream = process.getInputStream();

        //转成字符流
        InputStreamReader reader = new InputStreamReader(inputStream,"gbk");
        //缓冲
        char[] chars = new char[1024];
        int len = -1;
        while ((len = reader.read(chars))!=-1){
            String string = new String(chars,0,len);
            System.out.println(string);
        }
        inputStream.close();
        reader.close();
    }

    @Test
    public void testFFmpeg() throws IOException {
        //创建processBuilder对象
        ProcessBuilder processBuilder = new ProcessBuilder();
        //设置第三方应用程序的命令
        List<String> command = new ArrayList<>();
        command.add("E:\\ffmpeg\\ffmpeg-20180227-fa0c9d6-win64-static\\bin\\ffmpeg.exe");
        command.add("-i");
        command.add("F:\\WebStormProject\\video\\lucene_merge.avi");
        command.add("-y");//覆盖输出文件
        command.add("-c:v");
        command.add("libx264");
        command.add("-s");
        command.add("1280x720");
        command.add("-pix_fmt");
        command.add("yuv420p");
        command.add("-b:a");
        command.add("63k");
        command.add("-b:v");
        command.add("753k");
        command.add("-r");
        command.add("18");
        command.add("F:\\WebStormProject\\video\\lucene_merge.mp4");
        processBuilder.command(command);

        //将标准输入流和错误流合并
        processBuilder.redirectErrorStream(true);
        //启动一个进程
        Process process = processBuilder.start();

        //通过标准输入流来拿到正常和错误的信息
        InputStream inputStream = process.getInputStream();

        //转成字符流
        InputStreamReader reader = new InputStreamReader(inputStream,"gbk");
        //缓冲
        char[] chars = new char[1024];
        int len = -1;
        while ((len = reader.read(chars))!=-1){
            String string = new String(chars,0,len);
            System.out.println(string);
        }
        inputStream.close();
        reader.close();

    }

    @Test
    public void testMp4VideoUtil(){
        //String ffmpeg_path, String video_path, String mp4_name, String mp4folder_path
        String ffmpeg_path = "E:\\ffmpeg\\ffmpeg-20180227-fa0c9d6-win64-static\\bin\\ffmpeg.exe";
        String video_path = "F:\\WebStormProject\\video\\lucene_merge.avi";
        String mp4_name = "lucene_merge.mp4";
        String mp4folder_path = "F:\\WebStormProject\\video\\";
        Mp4VideoUtil mp4VideoUtil = new Mp4VideoUtil(ffmpeg_path,video_path,mp4_name,mp4folder_path);
        //生成mp4
        String result = mp4VideoUtil.generateMp4();
        System.out.println(result);
    }
}
