# 🚀 Line for GitHub Actions

[GitHub Action](https://developer.github.com/actions/) for sending a [Line](https://developers.line.biz/en/docs/messaging-api/overview/) message.

[![Actions Status](https://github.com/appleboy/line-action/workflows/line%20message/badge.svg)](https://github.com/appleboy/line-action/actions)

## Usage

Send custom message and see the custom variable as blow.

```yml
name: line message
on: [push]
jobs:

  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: send custom message with args
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        args: line message from GitHub Actions ${{ github.event_name }} event.
```

### Example

send location message:

```yaml
    - name: send location message
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        locations: "竹北體育館::新竹縣竹北市::24.834687::120.993368"
```

send sticker message: format is `packageId::stickerId`

For information on package IDs, see the [Sticker list](https://developers.line.biz/media/messaging-api/sticker_list.pdf).

```yaml
    - name: send sticker message
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        stickers: "1::1::100"
```

send image message: format is `originalContentUrl::previewImageUrl`

```yaml
    - name: send image message
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        images: "https://cdn3.iconfinder.com/data/icons/picons-social/57/16-apple-128.png"
```

send audio message: format is `originalContentUrl::duration`

```yaml
    - name: send audio message
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        audios: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3::20"
```

send video message: format is `originalContentUrl::previewImageUrl`

```yaml
    - name: send video message
      uses: appleboy/line-action@master
      with:
        secret: ${{ secrets.secret }}
        token: ${{ secrets.token }}
        room: ${{ secrets.room }}
        videos: "https://cuts.diamond.mlb.com/FORGE/2019/2019-09/28/ee8d662f-8984c7b1-2fc40a58-csvm-diamondx64-asset_1280x720_59_4000K.mp4"
```
