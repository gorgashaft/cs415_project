"""
URL configuration for cs415 project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from cs415 import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('users/', views.UserTableAPIView.as_view()),
    path('movies/', views.MovieTableAPIView.as_view()),
    path('ratings/', views.RatingsTableAPIView.as_view()),
    path('studio/', views.StudioTableAPIView.as_view()),
    path('genre/', views.GenreTableAPIView.as_view()),
    path('users/user/<int:id>', views.GetSingleUserAPIView.as_view()),
    path('users/email/<str:email>', views.GetSingleUserEmailAPIView.as_view()),
    path('movies/movie/<int:id>', views.GetSingleMovieAPIView.as_view()),
    path('movies/director/<str:director>', views.GetSingleMovieDirectorAPIView.as_view()),
    path('ratings/rating/<int:id>', views.GetSingleRatingAPIView.as_view()),
    path('ratings/movierating/<int:movie_id>', views.GetRatingsOnSingleMovieAPIView.as_view()),
    path('studios/studio/<int:id>', views.GetSingleStudioAPIView.as_view()),
    path('studios/prodcompany/<str:studio>', views.GetProductionStudioAPIView.as_view()),
    path('genres/genre/<int:id>', views.GetSingleGenreAPIView.as_view()),
]
