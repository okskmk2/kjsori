from django.shortcuts import render, redirect
from .models import Article
from django.contrib.auth.models import User
from django.utils.html import escape


def notice(request):
    notice_list = Article.objects.filter(kind='notice')
    context = {'notice_list': notice_list}
    return render(request, template_name='board/notice.html', context=context)


def local(request):
    local_list = Article.objects.filter(kind='local')
    context = {'local_list': local_list}
    return render(request, template_name='board/local.html', context=context)


def local_detail(request, article_id):
    local = Article.objects.get(pk=article_id)
    context = {'local': local}
    return render(request, template_name='board/local_detail.html', context=context)


def local_add(request):
    if request.method == 'GET':
        return render(request, template_name='board/local_add.html')
    elif request.method == 'POST':
        a = Article(
            title=request.POST.get('title'),
            author_id_id=request.POST.get('author_id'),
            content=request.POST.get('content'),
            kind='local'
            )
        a.save()
        return redirect('/local/')


def picture(request):
    picture_list = Article.objects.filter(kind='picture')
    context = {'picture_list': picture_list}
    return render(request, template_name='board/picture.html', context=context)


def about(request):
    about_x = Article.objects.filter(kind='about').last()
    context = {'content': about_x.content}
    return render(request, template_name='about.html', context=context)


def course(request):
    course_x = Article.objects.filter(kind='course')
    context = {'course': course_x}
    return render(request, template_name='course.html')


def home(request):
    return render(request, template_name='home.html')

