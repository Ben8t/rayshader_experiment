# main.r
library(rayshader)

# Plot Monterey bay in 2D
montereybay %>%
    sphere_shade(texture="imhof2") %>%
    plot_map()

# Plot Monterey bay in 3D
montereybay %>%
    sphere_shade(texture="imhof2") %>%
    plot_3d(montereybay, zscale=50)

# Loading and plot in 2D local data
raster::raster("data/local_data.tif") -> localtif
elmat <- matrix(raster::extract(localtif, raster::extent(localtif), buffer=1000),
               nrow=ncol(localtif), ncol=nrow(localtif))
elmat %>%
    sphere_shade(texture="imhof3") %>%
    add_shadow(ray_shade(elmat, lambert=TRUE), 0.7) %>%
    plot_map(rotate=0)

# Ploting local data in 3D and save to STL file
elmat %>%
    sphere_shade(texture="unicorn") %>%
    add_shadow(ray_shade(elmat, lambert=TRUE), 0.2) %>%
    plot_3d(elmat)
save_3dprint("data/local_data.stl")