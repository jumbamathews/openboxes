<!--  Show recent shipments/receipts -->
<%@ page import="org.pih.warehouse.shipping.ShipmentStatusCode"%>

<g:set var="dateCreatedFrom" value="${start.format('MM/dd/yyyy')}"/>
<g:set var="dateCreatedTo" value="${end.format('MM/dd/yyyy')}"/>

<div class="box">
    <h2>
        <warehouse:message code="requisition.summary.label" default="Requisition Summary"/>
        <small>Requisitions created in the last ${end - start} days</small>
    </h2>
	<div class="box-content" style="padding:0; margin:0">
        <table>
            <tbody>
                <tr>
                    <g:set var="i" value="${0}"/>
                    <g:each var="status" in="${org.pih.warehouse.requisition.RequisitionStatus.listValid()}">
                        <g:set var="requisitionCount" value="${requisitionStatistics[status]?:0}"/>
                        <g:set var="statusMessage" value="${format.metadata(obj: status)}"/>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <p class="center">
                                            <g:link controller="requisition" action="list" params="[status:status,dateCreatedFrom:dateCreatedFrom,dateCreatedTo:dateCreatedTo]" fragment="${statusMessage}">
                                                ${format.metadata(obj: status)}
                                            </g:link>
                                        </p>

                                        <p class="indicator">
                                            <g:link controller="requisition" action="list"
                                                    params="[status:status,dateCreatedFrom:dateCreatedFrom,dateCreatedTo:dateCreatedTo]" fragment="${statusMessage}">
                                                ${requisitionStatistics[status]?:0}
                                            </g:link>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <g:set var="i" value="${i+1}"/>
                    </g:each>
                </tr>
            </tbody>
            <tfoot>
                <tr class="odd">
                    <th colspan="${org.pih.warehouse.requisition.RequisitionStatus.listValid().size()-1}">
                        <label>${warehouse.message(code:'default.total.label')}</label>
                    </th>
                    <th class="right">
                        <div class="indicator">
                            <g:link controller="requisition" action="list">
                                ${requisitionStatistics["ALL"]?:0}
                            </g:link>
                        </div>
                    </th>
                </tr>
            </tfoot>
        </table>
	</div>
</div>