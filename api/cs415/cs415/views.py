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
    def get(self, request, email):
        user = UserTable.objects.filter(email=email)
        serializer = UserTableSerializer(user)
        return Response({'User': serializer.data})

class MovieTableAPIView(APIView):
    def get(self,request):
        movies = MovieTable.objects.all()
        serializer = MovieTableSerializer(movies, many=True)
        return Response({'Movies': serializer.data})

class RatingsTableAPIView(APIView):
    def get(self,request):
        ratings = RatingsTable.objects.all()
        serializer = RatingsTableSerializer(ratings, many=True)
        return Response({'Ratings': serializer.data})

class StudioTableAPIView(APIView):
    def get(self,request):
        studio = StudioTable.objects.all()
        serializer = StudioTableSerializer(studio, many=True)
        return Response({'Studio': serializer.data})
    
class GenreTableAPIView(APIView):
    def get(self,request):
        genre = GenreTable.objects.all()
        serializer = GenreTableSerializer(genre, many=True)
        return Response({'Genre': serializer.data})

