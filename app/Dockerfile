FROM ubuntu:18.04

ENV ANDROID_VERSION="33"
ENV ANDROID_ARCHITECTURE="x86_64"

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-11-jdk wget clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libpulse0

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer

# Prepare Android directories and system variables
WORKDIR /home/developer/Android/sdk/.android
RUN touch repositories.cfg
ENV ANDROID_HOME /home/developer/Android

# Set up Android SDK
WORKDIR /home/developer
RUN mkdir -p /home/developer/Android/cmdline-tools
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
RUN unzip sdk-tools.zip -d /home/developer/Android/cmdline-tools && rm sdk-tools.zip
RUN mv /home/developer/Android/cmdline-tools/cmdline-tools /home/developer/Android/cmdline-tools/latest
RUN yes | /home/developer/Android/cmdline-tools/latest/bin/sdkmanager --install \
    "platform-tools" "platforms;android-$ANDROID_VERSION" "build-tools;30.0.3" "emulator" "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE"
ENV PATH "$PATH:/home/developer/Android/cmdline-tools/latest/bin"

# Download Flutter SDK
WORKDIR /home/developer
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"

# Update packages & prep dev env
RUN flutter update-packages
RUN yes | flutter doctor --android-licenses
RUN flutter emulators --create

# Run basic check
CMD [ "flutter", "doctor" ] 