
  create or replace  view SF_DBT_DWH_ATM.DBT_DEV.STG_SNAPSHOTS 
  
   as (
    SELECT * FROM SF_DBT_DWH_ATM.DBT_DEV.snapshots
  );
