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
