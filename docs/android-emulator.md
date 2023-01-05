<h1><a href="#" id="android-emulator">Setup Android Emulator</a></h1>

<a href="https://cordova.apache.org/docs/en/10.x/guide/platforms/android/index.html" >See Cordova 
Android Platform Guide For More Details</a>

<h2><a href="#" id="environment-variables">Setting Environment Variables</a></h2>

Cordova's CLI tools require some environment variables to be set in order to function correctly. 
The CLI will attempt to set these variables for you, but in certain cases you may need to set them 
manually. The following variables should be updated:

1. Set the `JAVA_HOME` environment variable to the location of your JDK installation
2. Set the `ANDROID_SDK_ROOT` environment variable to the location of your Android SDK installation
3. It is also recommended that you add the Android SDK's `cmdline-tools/latest/bin`, emulator and 
platform-tools directories to your PATH
4. For apksigner and zipalign, the Android SDK's `build-tools` must also be added to your `PATH`

*Note: setting environment variable will differ depending on your Operating System*

```text
ANDROID_SDK_ROOT=/path/to/Android/sdk
PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
PATH=$PATH:$ANDROID_SDK_ROOT/emulator/
```

<h2><a href="#" id="android-virtual-devices">Create and manage virtual devices</a></h2>

An Android Virtual Device (AVD) is a configuration that defines the characteristics of an Android 
phone, tablet, Wear OS, Android TV, or Automotive OS device that you want to simulate in the [Android 
Emulator](https://developer.android.com/studio/run/emulator). The Device Manager is a tool you can launch from Android Studio that helps you create and 
manage AVDs

The best and easiest way to create a `virtual device` and install `platform tools` is to download and install [Android Studio](https://developer.android.com/studio). 
Launch Android Studio and open the [Device Manager](https://developer.android.com/studio/run/managing-avds.html) to install virtual devices. As 
a side note, you must install [sdk manager](https://developer.android.com/studio/command-line/sdkmanager).




