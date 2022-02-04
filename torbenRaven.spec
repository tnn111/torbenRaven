/*
A KBase module: torbenRaven
This module wraps the Raven assembler as a KBase App.
*/

module torbenRaven {
    typedef structure {
        string report_name;
        string report_ref;
    } ReportResults;

    /*
        This example function accepts any number of parameters and returns results in a KBaseReport
    */
    funcdef run_torbenRaven(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;

};
