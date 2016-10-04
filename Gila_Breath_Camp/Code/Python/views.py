from django.shortcuts import render

# Create your views here.

# Create your views here.
from django.http import HttpResponse


def test(request):
    context = ""
    return render(request,'test.html',context)