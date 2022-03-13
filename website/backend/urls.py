from django.urls import include, path
from rest_framework import routers
from backend import views

#create router for backend api
apiRouter = routers.DefaultRouter()
apiRouter.register(r'users', views.UserViewSet)
apiRouter.register(r'groups', views.GroupViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('api/', include('apiRouter.urls')),
]