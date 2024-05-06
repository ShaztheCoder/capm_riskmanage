sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'risk/module/riskmodule/test/integration/FirstJourney',
		'risk/module/riskmodule/test/integration/pages/RisksList',
		'risk/module/riskmodule/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('risk/module/riskmodule') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);