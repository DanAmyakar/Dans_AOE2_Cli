class api
> will hadle api get requests
> initial request will get a list of x and then iterate though that list calling x.new to instansiate x objects
> subsequent requests will be passed on x id to be used to make another get request for detailed info
> detailed info will be passed to x objects to update itself

class civ, tech, unit, etc
> create and save x objects
> x objects will be instantiated with name and id and saved to @@all
> additional attr_accessors or additional details to be updated when selected

class cli
> will handle input and out put
> call the api class to fetch all x ids
> list objects
> promt user for a selection
> pass use select to api to details request
> promt user to continue or exit