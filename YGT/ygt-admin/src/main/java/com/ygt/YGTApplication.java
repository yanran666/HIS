package com.ygt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class YGTApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(YGTApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  YGT启动成功   ლ(´ڡ`ლ)ﾞ  \n" +"\n" +
                "██╗   ██╗ ██████╗████████╗\n" +
                "╚██╗ ██╔╝██╔════╝╚══██╔══╝\n" +
                " ╚████╔╝ ██║  ███╗  ██║   \n" +
                "  ╚██╔╝  ██║   ██║  ██║   \n" +
                "   ██║   ╚██████╔╝  ██║   \n" +
                "   ╚═╝    ╚═════╝   ╚═╝   \n" +
                "                          \n");
    }
}
