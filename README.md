# opencv-android-sdk-with-contrib
opencv341 android sdk with contrib341 module build on windows.

天知道在windows上编译这俩个库要趟过多少坑。

工作需要，目前主要编译了armeabi-v7a和x86的.so库.a库，主要用于jni编程，附带java应用层函数。


## A templet build.gradle for armeabi-v7a with NDK

```
apply plugin: 'com.android.library'
android {
    ...
    defaultConfig {
        ...
        //配置NDK信息
        ndk {
            moduleName "opencv3"
            ldLibs "log", "jnigraphics", "m", "z"
            abiFilters "armeabi-v7a","x86"
        }
        //配置SO文件存放路径
        sourceSets {
            main {
                jni.srcDirs = []
                jniLibs.srcDirs = ['src/main/libs']
            }
        }
    }
    //设置构建脚本路径，会自动索引同目录下的Application.mk
    externalNativeBuild {
        ndkBuild {
            path 'src/main/jni/Android.mk'
        }
    }
}
...
```