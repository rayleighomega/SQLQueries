use usairlineflights2;

/*1*/
select count(flightID) as Count_Register from flights;

/*2*/
select sum(ArrDelay) / count(flightID) as Average_Delay_Arrivals,
sum(DepDelay) / count(DepDelay) as Average_Delay_Departures from flights;

/*3*/
select Origin, colYear as Year, colMonth as "Month", AVG(ArrDelay) as 'AVG Delay'
from flights where Origin = 'LAX' group by Origin, colYear, colMonth;

/*4*/
select City, colYear as Year, colMonth as "Month", AVG(ArrDelay) as 'AVG Delay'
from flights
inner join usairports on usairports.IATA = flights.Origin
group by City, colYear, colMonth;

/*5*/
select Description as Carriers, sum(Cancelled) as Cancelled
from carriers
inner join flights on flights.uniqueCarrier = carriers.CarrierCode
group by Carriers order by Cancelled desc;

/*6*/
select TailNum, Distance
from flights
group by TailNum order by Distance desc;

/*7*/
select CarrierCode as Carriers, AVG(ArrDelay) as Delay
from carriers
inner join flights on flights.uniqueCarrier = carriers.CarrierCode
group by Carriers order by Delay desc;

select * from flights