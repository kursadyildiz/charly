import speech_recognition as sr
import webbrowser as wb
import os
from playsound import playsound
import settings
import requests
r = sr.Recognizer()

def komut():
    with sr.Microphone() as source:
        audio = r.listen(source)
        text = r.recognize_google(audio)
    return text

playsound(settings.baslangic_sesi)
text = komut()
playsound(settings.tamam)

while 1:
    if text == "CMD":
        os.startfile(settings.cmd)
    elif text == "open":
        listen = komut()
        try:
            istek = requests.get("http://www.{}.com.tr".format(listen))
            if istek.status_code == 200:
                print(listen)
                wb.open("http://www.{}.com.tr".format(listen))
                if listen == "YouTube":
                    playsound(settings.arastir)
                    sorgu = komut()
                    wb.open("http://www.youtube.com.tr/results?search_query={}".format(sorgu))
                if listen == "Google":
                    playsound(settings.arastir)
                    sorgu = komut()
                    wb.open("http://www.google.com.tr/search?q={}".format(sorgu))
                if listen == "n11":
                    playsound(settings.arastir)
                    sorgu = komut()
                    wb.open("https://www.n11.com/arama?q={}".format(sorgu))


        except:
            if listen == "bye":
                playsound(settings.bye)
                exit()
