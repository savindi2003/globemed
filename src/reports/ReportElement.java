package reports;


public interface ReportElement {
    void accept(ReportVisitor visitor);
}
