
<img align="center" width="180px" src="https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png">

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

# Setup the Project

## Step 1
### Setup & Rename Package
------
1. rename `flutter_boilerplate` to your package name
2. rename app title at `app.dart`

**For iOS**
1. Change app bundle identifier
2. Change app name
   1. Open file `Runner.xcworkspace`
   2. Go to build Settings for App Target
   3. Change application name for `APP_DISPLAY_NAME`

**For Android**
1. change app bundle identifier at `android/app/build.gradle`
   

2. setup api baseURL at `main_dev.dart` and `main_prod.dart`
3. setup storage namespace at `main.dart` e.g. SecureStorageImpl('app_name')



## Step 2
### Setup & Activate Firebase
------

1. import the firebase_core plugin 
#### **`lib/main.dart`**
``` dart
import 'package:firebase_core/firebase_core.dart';
```
2. Within the run function, ensure WidgetsFlutterBinding is initialized and then initialize Firebase:
#### **`lib/main.dart`**
``` dart
void run(Config config) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    }
}
```

**For iOS**
1. Replace Firebase GoogleService-Info.plist for dev and prod at path `ios/config/dev` and `ios/config/prod`

**For Android**
1. Replace Firebase `google-services.json` for dev and prod at path `android/app/src/dev` and `android/app/src/prod`
2. Execute the plugin by adding the following underneath the line apply `plugin: 'com.android.application'`, within the `/android/app/build.gradle` file


## Step 3
### Generate assets and classes
------
#### Flutter Launcher Icons 
1. Setup the config file 
   Replace your app icon to `assets/icon/icon_android.png` and `assets/icon/icon_ios.png`
2. Run the package 
   
``` console
$ flutter pub run flutter_launcher_icons:main
```

#### Generate model .g

``` console
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```
-------

### Fastlane (only iOS)
1. Create git for store cerificate and provisiong profile
2. Relace your git url to `GIT_URL` at `ios/fastlane/Matchfile`

-------

### Run the app
#### Dev
```console
$flutter run --flavor dev -t lib/main_dev.dart  
```

#### Prod
```console
$flutter run --flavor prod -t lib/main_prod.dart  
```