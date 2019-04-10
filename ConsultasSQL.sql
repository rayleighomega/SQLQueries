use usairlineflights2;

/*1*/
select count(flightID) as Count_Register from flights;

/*2*/
select Origin, sum(ArrDelay) / count(flightID) as prom_arrivades,
sum(DepDelay) / count(DepDelay) as prom_sortides from flights group by Origin;

/*3*/
select Origin, colYear as Year, colMonth as Month, AVG(ArrDelay) as prom_arrivadas
from flights group by Origin, colYear, colMonth;

/*4*/
select City, colYear as Year, colMonth as Month, AVG(ArrDelay) as prom_arrivades
from flights
inner join usairports on usairports.IATA = flights.Origin
group by City, colYear, colMonth;

/*5*/
select CarrierCode as UniqueCarrier, colYear, AVG(ArrDelay) as avg_delay, sum(Cancelled) as total_cancelled
from carriers
inner join flights on flights.uniqueCarrier = carriers.CarrierCode
group by UniqueCarrier order by total_cancelled desc;

/*6*/
select TailNum, sum(Distance) as Distance
from flights
group by TailNum having TailNum <> "NA" order by Distance desc limit 10;

/*7*/
select CarrierCode as UniqueCarrier, AVG(ArrDelay) as avgDelay
from carriers
inner join flights on flights.uniqueCarrier = carriers.CarrierCode
group by UniqueCarrier having avgDelay > 10 order by avgDelay desc;

select * from flights