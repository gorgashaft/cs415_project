from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from cs415.models import UserTable, MovieTable, RatingsTable, StudioTable, GenreTable
from cs415.serializers import UserTableSerializer, MovieTableSerializer, RatingsTableSerializer, StudioTableSerializer, GenreTableSerializer, ProductionStudioTableSerializer

class UserTableAPIView(APIView):
    def get(self,request):
        users = UserTable.objects.all()
        serializer = UserTableSerializer(users, many=True)
        return Response({'Users': serializer.data})
    def post(self, request, *args, **kwargs):
        serializer = UserTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)

class GetSingleUserAPIView(APIView):
    def get(self, request, id):
        user = UserTable.objects.get(pk=id)
        serializer = UserTableSerializer(user)
        return Response({'User': serializer.data})
    
class GetSingleUserEmailAPIView(APIView):
    def get(self, request, email):
        user = UserTable.objects.filter(email=email)
        #for u in user:
        #    print('test', u.username, u.email)
        serializer = UserTableSerializer(user, many=True)
        return Response({'Users': serializer.data})

class MovieTableAPIView(APIView):
    def get(self,request):
        movies = MovieTable.objects.all()
        serializer = MovieTableSerializer(movies, many=True)
        return Response({'Movies': serializer.data})
    def post(self, request, *args, **kwargs):
        serializer = MovieTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleMovieAPIView(APIView):
    def get(self, request, id):
        movie = MovieTable.objects.get(pk=id)
        serializer = MovieTableSerializer(movie)
        return Response({'Movie': serializer.data})
    
class GetSingleMovieDirectorAPIView(APIView):
    def get(self, request, director):
        movie = MovieTable.objects.filter(director=director)
        serializer = MovieTableSerializer(movie, many=True)
        return Response({'Movies by Director': serializer.data})

class RatingsTableAPIView(APIView):
    def get(self,request):
        ratings = RatingsTable.objects.all()
        serializer = RatingsTableSerializer(ratings, many=True)
        return Response({'Ratings': serializer.data})
    def post(self, request, *args, **kwargs):
        serializer = RatingsTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleRatingAPIView(APIView):
    def get(self, request, id):
        rating = RatingsTable.objects.get(pk=id)
        serializer = RatingsTableSerializer(rating)
        return Response({'Rating': serializer.data})

class GetRatingsOnSingleMovieAPIView(APIView):
    def get(self, request, movie_id):
        rating = RatingsTable.objects.filter(movie_id=movie_id)
        serializer = RatingsTableSerializer(rating, many=True)
        return Response({'Ratings By Movie': serializer.data})

class StudioTableAPIView(APIView):
    def get(self,request):
        studios = StudioTable.objects.all()
        serializer = StudioTableSerializer(studios, many=True)
        return Response({'Studios': serializer.data})
    def post(self, request, *args, **kwargs):
        serializer = StudioTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleStudioAPIView(APIView):
    def get(self, request, id):
        studio = StudioTable.objects.get(pk=id)
        serializer = StudioTableSerializer(studio)
        return Response({'Studio': serializer.data})
    
class GetProductionStudioAPIView(APIView):
    def get(self, request, studio):
        prodcompany = StudioTable.objects.filter(studio=studio)
        serializer = ProductionStudioTableSerializer(prodcompany, many=True)
        return Response({'Production Companies that Collaborated w/ Studio': serializer.data})
    
class GenreTableAPIView(APIView):
    def get(self,request):
        genres = GenreTable.objects.all()
        serializer = GenreTableSerializer(genres, many=True)
        return Response({'Genres': serializer.data})
    def post(self, request, *args, **kwargs):
        serializer = GenreTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)

class GetSingleGenreAPIView(APIView):
    def get(self, request, id):
        genre = GenreTable.objects.get(pk=id)
        serializer = GenreTableSerializer(genre)
        return Response({'Genre': serializer.data})
