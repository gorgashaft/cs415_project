from rest_framework import serializers
from cs415.models import MovieTable, UserTable, RatingsTable, GenreTable, StudioTable

class UserTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserTable
        fields = '__all__'  # Or list the fields you want to include

class MovieTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieTable
        fields = '__all__'  # Or list the fields you want to include

class RatingsTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = RatingsTable
        fields = '__all__'  # Or list the fields you want to include

class GenreTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = GenreTable
        fields = '__all__'  # Or list the fields you want to include

class StudioTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudioTable
        fields = '__all__'  # Or list the fields you want to include

class ProductionStudioTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudioTable
        fields = 'studio','production_company'  # Or list the fields you want to include

