from django.db import models 

class GenreTable(models.Model):
    genre_id = models.AutoField(primary_key=True)
    genre = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'genre_table'
    
    def __str__(genreclass):
        return f'{genreclass.genre}'
    


class StudioTable(models.Model):
    studio_id = models.AutoField(primary_key=True)
    studio = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'studio_table'

    def __str__(distribution):
        return f'{distribution.production_company}'


class MovieTable(models.Model):
    movie_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    studio = models.ForeignKey(StudioTable, models.DO_NOTHING, blank=True, null=True)
    genre = models.ForeignKey(GenreTable, models.DO_NOTHING, blank=True, null=True)
    director = models.CharField(max_length=255, blank=True, null=True)
    release_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'movie_table'
    
    def __str__(movie):
        return f'{movie.title}'
    
class MovieGenreStudioView(models.Model):
    movie_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    studio = models.CharField(max_length=255, blank=True, null=True)
    genre = models.CharField(max_length=255, blank=True, null=True)
    director = models.CharField(max_length=255, blank=True, null=True)
    release_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'movie_table_view'
    
    def __str__(movie):
        return f'{movie.title}'

class RatingsTable(models.Model):
    rating_id = models.AutoField(primary_key=True)
    value = models.IntegerField(blank=True, null=True)
    movie = models.ForeignKey(MovieTable, models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('UserTable', models.DO_NOTHING, blank=True, null=True)
    comments = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ratings_table'

    def __str__(rating):
        return f'{rating.user} --- {rating.movie} --- {rating.value}'
    

class RatingsView(models.Model):
    rating_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    value = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    comments = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ratings_view'

    def __str__(rating):
        return f'{rating.first_name} --- {rating.last_name} --- {rating.title} --- {rating.value}'




class UserTable(models.Model):
    user_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True, unique=True)
    date_created = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_table'
    
    def __str__(self):
        return f'{self.first_name} {self.last_name}'

