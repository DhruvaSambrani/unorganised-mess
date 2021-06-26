### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ 903dfda0-cd33-11eb-2ab4-3703f9c5bb8e
using Plots

# ╔═╡ f3eec258-bba8-4587-a4c3-b478da007b64
begin
	function f((x,y))
		t = 4((x^2+y^2)^2 - 5(x^2+y^2))
		if x^2+y^2 > 1 && t>-10
			-10
		else
			t
		end
	end
	f(x,y) = f((x,y))
end

# ╔═╡ a2a7ed64-812e-414c-afef-934eaa8fb93a
begin
	xs = -2.5:0.11:2.5
	zs = map(f, Iterators.product(xs,xs))
end;

# ╔═╡ 74804f5c-e1a7-4d2c-8640-ca91d8ba4a18
cameray = 79

# ╔═╡ d6452350-02d3-45f2-bf6a-615df05701b1
begin
	ω = 2pi
	v = 2.0
	A = 0.3
	ts = 0:0.05:4
	cs = palette(:lightrainbow, ts)
end

# ╔═╡ 7bd18bce-88f0-40b9-a791-7f6710b041b1
begin
	anim = Animation()
	for i in 1:length(ts)
		t = ts[i]
		r = 1.5 + A*sin(ω*t)
		θ = v*t/4
		x, y = [r*cos(θ), r*sin(θ)]
		plot(xs, xs, zs, st=:wireframe, camera=(rad2deg(θ)/1.55, cameray), zlims=(-20,1), color=:white)
		plot!([x], [y], [f(x,y)+0.5], st=:scatter, markersize = 11, label="", color=cs[i], grid=false, axis=false, ticks=false, size=(400,400))
		frame(anim, current())
	end
end

# ╔═╡ 73504a9a-0e46-4753-9062-774c0c883984
gif(anim, fps=15)

# ╔═╡ Cell order:
# ╠═903dfda0-cd33-11eb-2ab4-3703f9c5bb8e
# ╠═f3eec258-bba8-4587-a4c3-b478da007b64
# ╠═a2a7ed64-812e-414c-afef-934eaa8fb93a
# ╠═74804f5c-e1a7-4d2c-8640-ca91d8ba4a18
# ╠═d6452350-02d3-45f2-bf6a-615df05701b1
# ╠═7bd18bce-88f0-40b9-a791-7f6710b041b1
# ╠═73504a9a-0e46-4753-9062-774c0c883984
