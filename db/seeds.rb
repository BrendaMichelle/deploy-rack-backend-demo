Toy.destroy_all

toys = [
      {
        name: "Woody",
        image: "http://www.pngmart.com/files/3/Toy-Story-Woody-PNG-Photos.png",
        likes: 33
      },
      {
        name: "Buzz Lightyear",
        image: "http://www.pngmart.com/files/6/Buzz-Lightyear-PNG-Transparent-Picture.png",
        likes: 14
      },
      {
        name: "Mr. Potato Head",
        image: "https://vignette.wikia.nocookie.net/universe-of-smash-bros-lawl/images/d/d8/Mr-potato-head-toy-story.gif/revision/latest?cb=20151129131217",
        likes: 3
      },
      {
        name: "Slinky Dog",
        image: "https://www.freeiconspng.com/uploads/slinky-png-transparent-1.png",
        likes: 4
      },
      {
        name: "Rex",
        image: "http://umich.edu/~chemh215/W11HTML/SSG5/ssg5.2/FRex.png",
        likes: 1
      },
      {
        name: "Bo Peep",
        image: "http://4.bp.blogspot.com/_OZHbJ8c71OM/Sog43CMFX2I/AAAAAAAADEs/0AKX0XslD4g/s400/bo.png",
        likes: 2
      },
      {
        name: "Hamm",
        image: "https://cdn140.picsart.com/244090226021212.png?r1024x1024",
        likes: 0
      },
      {
        name: "Little Green Men",
        image: "http://www.pngmart.com/files/3/Toy-Story-Alien-PNG-File.png",
        likes: -2
      }
    ]



toys.each do |toy_hash|
    Toy.create(toy_hash)
end

car1 = Car.create(company: "Honda", make: "Civic")
car2 = Car.create(company: "Hot Wheels", make: "Flames")
car3 = Car.create(company: "Bike", make: "Tricycle")



Lease.create(toy_id: Toy.first.id, car_id: car1.id, year: 2020)
Toy.first.leases.create(car: car2, year: 2020)

Lease.create(toy: Toy.second, car: car1, year: 1990)
Lease.create(toy: Toy.second, car: car3, year: 1990)