from django.db import models


class Article(models.Model):
    title = models.CharField(max_length=100)
    author_id = models.ForeignKey('auth.User', on_delete=True)
    edited_at = models.DateTimeField(auto_now=True)
    content = models.TextField(max_length=3000)
    file_url_id_list = models.CharField(max_length=100, blank=True)
    kind = models.CharField(max_length=30)


class Reply(models.Model):
    content = models.TextField(max_length=1000)
    author_id = models.ForeignKey('auth.User', on_delete=True)
    edited_at = models.DateTimeField(auto_now=True)
    article_id = models.ForeignKey('board.Article', on_delete=True)


class File(models.Model):
    url = models.CharField(max_length=80)
    name = models.CharField(max_length=50)
