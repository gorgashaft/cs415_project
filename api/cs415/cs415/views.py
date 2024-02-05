from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from cs415.models import UserTable, MovieTable, RatingsTable, StudioTable, GenreTable
from cs415.serializers import UserTableSerializer, MovieTableSerializer, RatingsTableSerializer, StudioTableSerializer, GenreTableSerializer

class UserTableAPIView(APIView):
    def get(self,request):
        users = UserTable.objects.all()
        serializer = UserTableSerializer(users, many=True)
        return Response({'Users': serializer.data})
    
class GetSingleUserAPIView(APIView):
    def get(self, request, id):
        user = UserTable.objects.get(pk=id)
        serializer = UserTableSerializer(user)
        return Response({'User': serializer.data})
    
class GetSingleUserEmailAPIView(APIView):
    def get(self, request, email):
        user = UserTable.objects.filter(email=email)
        serializer = UserTableSerializer(user)
        return Response({'Users': serializer.data})

class MovieTableAPIView(APIView):
    def get(self,request):
        movies = MovieTable.objects.all()
        serializer = MovieTableSerializer(movies, many=True)
        return Response({'Movies': serializer.data})
    
class GetSingleMovieAPIView(APIView):
    def get(self, request, id):
        movie = MovieTable.objects.get(pk=id)
        serializer = MovieTableSerializer(movie)
        return Response({'Movie': serializer.data})

class RatingsTableAPIView(APIView):
    def get(self,request):
        ratings = RatingsTable.objects.all()
        serializer = RatingsTableSerializer(ratings, many=True)
        return Response({'Ratings': serializer.data})
    
class GetSingleRatingAPIView(APIView):
    def get(self, request, id):
        rating = RatingsTable.objects.get(pk=id)
        serializer = RatingsTableSerializer(rating)
        return Response({'Rating': serializer.data})

class StudioTableAPIView(APIView):
    def get(self,request):
        studios = StudioTable.objects.all()
        serializer = StudioTableSerializer(studios, many=True)
        return Response({'Studios': serializer.data})
    
class GetSingleStudioAPIView(APIView):
    def get(self, request, id):
        studio = StudioTable.objects.get(pk=id)
        serializer = StudioTableSerializer(studio)
        return Response({'Studio': serializer.data})
    
class GenreTableAPIView(APIView):
    def get(self,request):
        genres = GenreTable.objects.all()
        serializer = GenreTableSerializer(genres, many=True)
        return Response({'Genres': serializer.data})

class GetSingleGenreAPIView(APIView):
    def get(self, request, id):
        genre = GenreTable.objects.get(pk=id)
        serializer = GenreTableSerializer(genre)
        return Response({'Genre': serializer.data})
