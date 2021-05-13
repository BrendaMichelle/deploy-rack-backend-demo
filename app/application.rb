class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/toys" && req.get?
      getToys
    elsif req.path == "/toys" && req.post?
      post_toy(req.body.read)
    elsif req.path.match(/toys/) && req.patch?
      path_toy(req.path)
    elsif req.path.match(/toys/) && req.delete?
      delete_toy(req.path)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  private

  def get_toys
    the_toy_json = Toy.increasing_likes.to_json({
      include: {
        leases: {
          include: :car,
        },
      },
      methods: [:professor_name, :dr_name],
    })

    [200, { "Content-Type" => "application/json" }, [the_toy_json]]
  end

  def post_toy(toy_json)
    toy_hash = JSON.parse(toy_json)
    new_toy = Toy.create(toy_hash)

    [201, { "Content-Type" => "application/json" }, [new_toy.consistent_data]]
  end

  def patch_toy(path)
    hash = JSON.parse(req.body.read)

    id = path.split("/toys/").last
    toy = Toy.find(id)

    toy.update(hash)

    [200, { "Content-Type" => "application/json" }, [toy.consistent_data]]
  end

  def delete_toy(path)
    id = path.split("/toys/").last
    toy = Toy.find(id)

    if (toy)
      toy.destroy
      [200, { "Content-Type" => "application/json" }, [toy.to_json]]
    else
      [404, {}, ["Could not find toy"]]
    end
  end
end
