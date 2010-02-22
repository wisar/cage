$numsamples = 64

def points_to_gesture(points)
  new_points = resample(points, $numsamples)
  new_points = rotate_to_zero(new_points)
  new_points = scale_to_square(new_points, size)
  new_points = translate_to_origin(new_points)
  return new_points
end

def distance(point1, point2)
  d = (point2.x - point1.x)**2 + (point2.y - point1.y)**2
  d = Math.sqrt(d)
  return d
end

def resample(points, numsamples)
  bigi = path_length(points) / (numsamples - 1)
  bigd = 0
  new_points = Array.new
  new_points << points[0]
  points.each_index do |i|
    if (i < 1)
    else
      d = distance(points[i-1], points[i])
      if (bigd + d) >= bigi
        x = points[i-1].x + ((bigi - bigd)/ d) * (points[i].x - points[i-1].x)
        y = points[i-1].y + ((bigi - bigd)/ d) * (points[i].y - points[i-1].y)
        temp_point = Point.new(x, y, 0)
        new_points << temp_point
        points[i] = temp_point
        bigd = 0
      else
        bigd = bigd + d
      end
    end
  end
end

def path_length(points)
  d = 0
  points.each do |point|
    if (i < 1)
    else
      d = d + distance(point[i-1], point[i])
    end
  end
  return d
end

def centroid(points)

end

def rotate_to_zero(points)
  c = Point.new(centroid(points))
  theta = Math.atan2((c.y - points[0].y),(c.x - points[0].x))
  new_points = rotate_by(points, -(theta))
  return new_points
end
