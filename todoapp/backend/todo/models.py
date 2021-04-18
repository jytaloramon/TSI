from django.db import models

# Create your models here.


class Task(models.Model):

    description = models.TextField(max_length=256, null=False)
    is_active = models.BooleanField(default=True, null=False)
    date_create = models.DateTimeField(null=False, auto_now=True)
    date_task = models.DateTimeField(null=False)
