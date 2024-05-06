namespace RiskManagement;

using {
    managed
} from '@sap/cds/common';

entity Risks : managed
{
    title : String(100) not null;
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    key ID : UUID;
    miti : Association to one Mitigations;
    supplier    : Association to Suppliers;
}

entity Mitigations : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}

using {  API_BUSINESS_PARTNER as bupa } from '../srv/external/API_BUSINESS_PARTNER';

view Suppliers as select from bupa.A_BusinessPartner mixin {
      risks : association to many Risks on risks.supplier.ID = $projection.ID;
  } into {
      key BusinessPartner as ID,
      BusinessPartnerFullName as fullName,
      BusinessPartnerIsBlocked as isBlocked,
      Customer as customer,
      Supplier as supplier,
      BusinessPartnerCategory as cat,
      risks,
      //to_BusinessPartnerAddress as addresses: redirected to SupplierAddresses
  };
