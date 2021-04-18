from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers
from .models import Task
import json

# Create your views here.


@csrf_exempt
def get(request):
    all_task = serializers.serialize('json', Task.objects.all())
    return JsonResponse(all_task, safe=False)


@csrf_exempt
def post(request):
    data = json.loads(request.body)
    task = Task(description=data['description'], date_task=data['date'])
    task.save()

    return JsonResponse({'status': 'ok'})


@csrf_exempt
def update(request):
    data = json.loads(request.body)
    task = Task.objects.get(id=data['id'])
    task.is_active = not(task.is_active)
    task.save()

    return JsonResponse({'status': 'ok'})

@csrf_exempt
def delete(request):
    data = json.loads(request.body)
    task = Task.objects.get(id=data['id']).delete()

    return JsonResponse({'status': 'ok'})
