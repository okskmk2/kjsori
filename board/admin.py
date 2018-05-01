from django.contrib import admin
from .models import Article, File, Reply

# Register your models here.
admin.site.register(Article)
admin.site.register(File)
admin.site.register(Reply)