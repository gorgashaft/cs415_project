from django.contrib import admin 
from .models import GenreTable, MovieTable, RatingsTable, StudioTable, UserTable

admin.site.register(GenreTable)
admin.site.register(MovieTable)
admin.site.register(RatingsTable)
admin.site.register(StudioTable)
admin.site.register(UserTable)
