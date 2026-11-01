FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

ENV FLUTTER_ROOT="/usr/local/flutter"
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_ROOT
ENV PATH="$FLUTTER_ROOT/bin:$FLUTTER_ROOT/bin/cache/dart-sdk/bin:$PATH"

WORKDIR /app
CMD ["tail", "-f", "/dev/null"]
