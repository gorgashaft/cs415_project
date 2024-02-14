from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from cs415.models import MovieGenreStudioView, RatingsView, UserTable, MovieTable, RatingsTable, StudioTable, GenreTable
from cs415.serializers import MovieViewSerializer, RatingsViewSerializer, UserTableSerializer, MovieTableSerializer, RatingsTableSerializer, StudioTableSerializer, GenreTableSerializer, ProductionStudioTableSerializer
from cs415.settings import JWT_AUTH
from cs415.authentication import JWTAuthentication

class Login(APIView):
    def post(self, request):
        email = request.data.get("email")
        password = request.data.get("password")
 
        if not email or not password:
            return Response({'success': False,
                             'error': 'Email and Password must have a value'},
                             status = status.HTTP_400_BAD_REQUEST)
 
        check_user = UserTable.objects.filter(email=email).exists()
        if check_user == False:
            return Response({'success': False,
                             'error': 'User with this email does not exist'},
                             status=status.HTTP_404_NOT_FOUND)
 
        check_pass = UserTable.objects.filter(email=email, password=password).exists()
        if check_pass == False:
            return Response({'success': False,
                             'error': 'Incorrect password for user'},
                             status=status.HTTP_401_UNAUTHORIZED)
        user = UserTable.objects.get(email=email, password=password)
        if user is not None:
            jwt_token = JWTAuthentication.create_jwt(user)
            data = {
                'token': jwt_token
            }
            return Response({'success': True,
                             'user_id': user.pk, 
                             'token': jwt_token},
                             status=status.HTTP_200_OK)
        else:
            return Response({'success': False,
                             'error': 'Invalid Login Credentials'},
                             status=status.HTTP_400_BAD_REQUEST)


class UserTableAPIView(APIView):
    def get(self,request):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        users = UserTable.objects.all()
        serializer = UserTableSerializer(users, many=True)
        return Response({'Users': serializer.data})
    def post(self, request, *args, **kwargs):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        serializer = UserTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)

class GetSingleUserAPIView(APIView):
    def get(self, request, id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        user = UserTable.objects.get(pk=id)
        serializer = UserTableSerializer(user)
        return Response({'User': serializer.data})
    
class GetSingleUserEmailAPIView(APIView):
    def get(self, request, email):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        user = UserTable.objects.filter(email=email)
        serializer = UserTableSerializer(user, many=True)
        return Response({'Users': serializer.data})

class MovieTableAPIView(APIView):
    def get(self,request):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        movies = MovieGenreStudioView.objects.all()
        serializer = MovieViewSerializer(movies, many=True)
        return Response({'Movies': serializer.data})
    def post(self, request, *args, **kwargs):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        print(type(request.data), request.data)
        temp = {
            **request.data,
            'studio_id': int(request.data['studioId']),
            'genre_id': int(request.data['genreId']),
        }
        print(temp)
        serializer = MovieTableSerializer(data=temp)
        if serializer.is_valid():
            movie_instance = serializer.save()
            movie_instance.studio_id = request.data['studioId']
            movie_instance.genre_id = request.data['genreId']
            movie_instance.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleMovieAPIView(APIView):
    def get(self, request, id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        movie = MovieTable.objects.get(pk=id)
        serializer = MovieTableSerializer(movie)
        return Response({'Movie': serializer.data})
    
class GetSingleMovieDirectorAPIView(APIView):
    def get(self, request, director):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        movie = MovieTable.objects.filter(director=director)
        serializer = MovieTableSerializer(movie, many=True)
        return Response({'Movies by Director': serializer.data})

class RatingsTableAPIView(APIView):
    def get(self,request):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        ratings = RatingsView.objects.all()
        serializer = RatingsViewSerializer(ratings, many=True)
        return Response({'Ratings': serializer.data})
    def post(self, request, *args, **kwargs):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        serializer = RatingsTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleRatingAPIView(APIView):
    def get(self, request, id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        rating = RatingsTable.objects.get(pk=id)
        serializer = RatingsTableSerializer(rating)
        return Response({'Rating': serializer.data})

class GetRatingsOnSingleMovieAPIView(APIView):
    def get(self, request, movie_id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        rating = RatingsTable.objects.filter(movie_id=movie_id)
        serializer = RatingsTableSerializer(rating, many=True)
        return Response({'Ratings By Movie': serializer.data})

class StudioTableAPIView(APIView):
    def get(self,request):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        studios = StudioTable.objects.all()
        serializer = StudioTableSerializer(studios, many=True)
        return Response({'Studios': serializer.data})
    def post(self, request, *args, **kwargs):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        serializer = StudioTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)
    
class GetSingleStudioAPIView(APIView):
    def get(self, request, id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        studio = StudioTable.objects.get(pk=id)
        serializer = StudioTableSerializer(studio)
        return Response({'Studio': serializer.data})
    
class GetProductionStudioAPIView(APIView):
    def get(self, request, studio):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        prodcompany = StudioTable.objects.filter(studio=studio)
        serializer = ProductionStudioTableSerializer(prodcompany, many=True)
        return Response({'Production Companies that Collaborated w/ Studio': serializer.data})
    
class GenreTableAPIView(APIView):
    def get(self,request):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        genres = GenreTable.objects.all()
        serializer = GenreTableSerializer(genres, many=True)
        return Response({'Genres': serializer.data})
    def post(self, request, *args, **kwargs):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        serializer = GenreTableSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'Data': serializer.data})
        else:
            return Response({'Errors': serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST)

class GetSingleGenreAPIView(APIView):
    def get(self, request, id):
        if JWT_AUTH: JWTAuthentication.authenticate(self,request=request)
        genre = GenreTable.objects.get(pk=id)
        serializer = GenreTableSerializer(genre)
        return Response({'Genre': serializer.data})
