from django.shortcuts import render
from django.http import HttpResponse


def aboutUs(request):
    return render(request,"index.html")
def course(request,data):
    return HttpResponse(data)

