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

/**
 * @author Administrator
 * @version 1.0
 * @create 2018-07-12 9:11
 **/
@SpringBootTest
@RunWith(SpringRunner.class)
public class TestProcessBuilder {
    //使用processBuilder来调用第三方应用程序
    @Test
    public void testProcessBuilder() throws IOException {
        //创建processBuilder对象
        ProcessBuilder processBuilder = new ProcessBuilder();
        //设置第三方应用的命令
        List<String> command = new ArrayList<>();
        command.add("D:/ffmpeg-20200413-59e3a9a-win64-static/bin/ffmpeg.exe");
        command.add("-i");
        command.add("D:/video/solr.avi");
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
        command.add("D:/video/solr.mp4");
        processBuilder.command(command);
        //将标准输入流和错误流合并
        processBuilder.redirectErrorStream(true);
        //启动一个进程
        Process process = processBuilder.start();
        //通过标准输入流来拿到正常和错误的信息
        InputStream inputStream = process.getInputStream();
        //转成字符流
        InputStreamReader reader = new InputStreamReader(inputStream, "GBK");
        //缓冲
        char[] chars = new char[1024];
        int len = -1;
        while ((len = reader.read(chars)) != -1) {
            String string = new String(chars, 0, len);
            System.out.println(string);
        }
        inputStream.close();
        reader.close();
    }

    @Test
    public void testMp4VideoUtil() {
        String ffmpeg_path = "D:/ffmpeg-20200413-59e3a9a-win64-static/bin/ffmpeg.exe";
        String video_path = "D:/video/solr.avi";
        String mp4_name = "solr.mp4";
        String mp4folder_path = "D:/video/";
        Mp4VideoUtil mp4VideoUtil = new Mp4VideoUtil(ffmpeg_path, video_path, mp4_name, mp4folder_path);
        //生成mp4
        String result = mp4VideoUtil.generateMp4();
        System.out.println(result);
    }
}
