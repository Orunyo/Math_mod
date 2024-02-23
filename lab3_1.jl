using Plots
using DifferentialEquations

x₀ = 32000
y₀ = 12000

a = 0.299
b = 0.788
c = 0.311
h = 0.466

P(t) = abs(cos(0.5*t))
Q(t) = abs(sin(4*t))

u₀ = [x₀, y₀]
p = (a, b, c, h)
T = [0, 2]

function F(du, u, p, t)
    a, b, c, h = p
    du[1] = -a * u[1] - b * u[2] + P(t) 
    du[2] = -c * u[1] * u[2] - b * u[2] + Q(t)
end

prob = ODEProblem(F, u₀, T, p)

sol = solve(prob)

plt = plot!(
	   sol,
	    vars=(0,1),
	    color=:red,
	    label="X army",
	    title="Модель боевых действий",
	    ylabel="численность войск"
	   )
plot!(
      sol,
      vars=(0,2),
      color=:blue,
     label="Y army",
     xlabel="Время")

savefig(plt, "lab3_3.png")