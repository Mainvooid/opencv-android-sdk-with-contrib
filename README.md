# opencv-android-sdk-with-contrib
opencv341 android sdk with contrib341 module build on windows.

天知道在windows上编译这俩个库要趟过多少坑。

工作需要，目前主要编译了armeabi-v7a的.so库.a库，主要用于jni编程，附带java应用层函数。


## A build.gradle for armeabi-v7a with NDK
apply plugin: 'com.android.library'
android {
    compileSdkVersion 23

    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 23
        versionCode 1
        versionName "1.0"
        //配置NDK信息
        ndk {
            moduleName "opencv3"
            ldLibs "log", "jnigraphics", "m", "z"
            abiFilters "armeabi-v7a"
        }
        //配置SO文件存放地址
        sourceSets {
            main {
                jni.srcDirs = []
                jniLibs.srcDirs = ['src/main/libs']
            }
        }
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
    //设置构建脚本路径
    externalNativeBuild {
        ndkBuild {
            path 'src/main/jni/Android.mk'
        }
    }
}