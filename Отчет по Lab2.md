**Отчет по Лабораторной работе №1** 

Вариант 66  

На море в тумане катер береговой охраны преследует лодку браконьеров. Через определенный промежуток времени туман рассеивается, и лодка обнаруживается на расстоянии 18,9 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Известно, что скорость катера в 5,5 раза больше скорости браконьерской лодки. 1. Запишите уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени). 2. Постройте траекторию движения катера и лодки для двух случаев. 3. Найдите точку пересечения траектории катера и лодки 

**Выполнение** 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.001.png)

Определение варианта 

Начальные координаты катера (18,9 ; 0) Обозначим скорость лодки v 

Чтобы найти расстояние x составим формулу 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.002.png)

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.003.png)

Из данных уравнений можно найти расстояние после которого катер начнет раскручиваться по спирали. Решения для них будет следующим 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.004.png) ![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.005.png)

Решим задачу, описывающее движение катера, с начальными условиями для двух случаев 

Для этого давайте скачаем Julia, язык программирования, специализирующийся в решениях подобных задач 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.006.jpeg)

Находим самый свежий релиз и качаем его Устанавливаем все нужные нам библиотеки 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.007.png)

Пишем код 

using Plots ![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.008.png)

using DifferentialEquations 

function F(du,u,p,t) 

` `r, θ = u 

` `du[1] = 2 

` `du[2] = sqrt(19.25) / u[1] end 

r₀ = 18.1/5.5 

h = 0.1 

θ₀ = 0.0 

tspan = (0, 100) 

prob = ODEProblem(F, [r₀, θ₀], tspan) sol = solve(prob, dtmax=h) 

- Достаем значения ![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.009.png)

R = [u[1] for u in sol.u] Θ = [u[2] for u in sol.u] 

boat\_r = Float64[0.0, 100.0] boat\_θ = Float64[7π/4] 

- Находим пересечение 

intersection\_r = 0 

for (i,θ) in enumerate(Θ) 

` `if (round(θ, digits=2) == round(boat\_θ[1], digits=2))   global intersection\_r = R[i] 

`  `break 

` `end 

end 

@show intersection\_r 

plt = plot( 

`    `proj = :polar, 

`    `aspect\_ratio=:equal, 

`    `dpi=300, 

`    `title="Задача о погоне",     legend=true) 

plot!( 

`      `plt, 

`      `Θ, 

`      `R, 

`      `label="Траектория катера",       color=:green) 

plot!( 

`      `plt, 

`      `boat\_θ, 

`      `boat\_r, 

`      `label="Траектория лодки",       color=:red) 

plot!( 

`      `plt, 

`      `boat\_θ, 

`      `[intersection\_r], 

`      `seriestype = :scatter, 

`      `label="Точка пересечения",       color=:blue) 

savefig(plt, "lab02\_1.png") r₀ = 18.1/3.5 

θ₀ = π ![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.010.png)

prob = ODEProblem(F, [r₀, θ₀], tspan) sol = solve(prob, dtmax=h) 

- Достаем значения 

R = [u[1] for u in sol.u] Θ = [u[2] for u in sol.u] 

boat\_r = Float64[0.0, 100.0] 

- Находим пересечение 

for (i,θ) in enumerate(Θ) 

` `if (round(θ, digits=2) == round(boat\_θ[1], digits=2))   global intersection\_r = R[i] 

`  `break 

` `end 

end 

@show intersection\_r 

plt2 = plot( 

`     `proj = :polar, 

`     `aspect\_ratio=:equal, 

`     `dpi=300, 

`     `title="Задача о погоне",      legend=true) 

plot!( 

`      `plt2, 

`      `Θ, 

`      `R, 

`      `label="Траектория катера",       color=:green) 

plot!( 

`      `plt2, 

`      `boat\_θ, 

`      `boat\_r, 

`      `label="Траектория лодки",       color=:red) 

plot!( 

`      `plt2, 

`      `boat\_θ, 

`      `[intersection\_r], 

`      `seriestype = :scatter, 

`      `label="Точка пересечения",       color=:blue) 

savefig(plt2, "lab02\_2.png") ![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.011.png)

После запускаем файл с кодом через PowerShell 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.012.png)

И он создает нам вот такие картинки с траекторией катера 

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.013.jpeg)

![](Aspose.Words.577835bd-b50f-4658-b7f7-641924205a17.014.jpeg)
