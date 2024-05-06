using { RiskManagement as my } from '../db/schema.cds';

@path : '/service/RiskManage'
service RiskManage
{
    entity Risks @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on my.Risks;
    annotate Risks with @odata.draft.enabled;
  entity Mitigations @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ])  as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;

    @readonly
    entity Suppliers @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer', 'RiskManager' ]
            }
        ]) as projection on my.Suppliers;
}


