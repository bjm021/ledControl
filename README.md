# led_control

A simpled UDP LED Control App

![ledControl Home](https://cdn.bjmsw.net/img/D91D0548-95B0-44B2-B5CC-FE8C223016AE.png)

## ledControl

This is still ok development!!!

This project is a companion to the [espLed2](https://github.com/bjm021/espLed2) project.

Because the new espLed2 uses UDP instead of TCP we need a client to send the UDP packets. This simple Flutter App does exactly that. It sends the necessary UDP packages to an ESP32 in the local network running espLed2. 

It has a very simple interface with three sliders (RGB) and a simple Settings page (used to set the ESP32 IP).
